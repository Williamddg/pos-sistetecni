-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.activations (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  license_key_id uuid,
  machine_id text,
  device_name text,
  activated_at timestamp with time zone DEFAULT now(),
  last_check_at timestamp with time zone,
  revoked_at timestamp with time zone,
  CONSTRAINT activations_pkey PRIMARY KEY (id),
  CONSTRAINT activations_license_key_id_fkey FOREIGN KEY (license_key_id) REFERENCES public.license_keys(id)
);
CREATE TABLE public.customers (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name text,
  nit text,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT customers_pkey PRIMARY KEY (id)
);
CREATE TABLE public.license_activations (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  license_key text NOT NULL,
  machine_id text NOT NULL,
  first_seen timestamp with time zone NOT NULL DEFAULT now(),
  last_seen timestamp with time zone NOT NULL DEFAULT now(),
  revoked boolean NOT NULL DEFAULT false,
  CONSTRAINT license_activations_pkey PRIMARY KEY (id),
  CONSTRAINT license_activations_license_key_fkey FOREIGN KEY (license_key) REFERENCES public.licenses(license_key)
);
CREATE TABLE public.license_keys (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  subscription_id uuid,
  key text UNIQUE,
  max_activations integer DEFAULT 1,
  active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT license_keys_pkey PRIMARY KEY (id),
  CONSTRAINT license_keys_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id)
);
CREATE TABLE public.licenses (
  license_key text NOT NULL,
  plan text NOT NULL CHECK (plan = ANY (ARRAY['MONTHLY'::text, 'YEARLY'::text, 'LIFETIME'::text])),
  status text NOT NULL CHECK (status = ANY (ARRAY['ACTIVE'::text, 'BLOCKED'::text, 'RELEASED'::text, 'ARCHIVED'::text])),
  current_period_end timestamp with time zone,
  max_machines integer NOT NULL DEFAULT 1,
  customer_name text,
  customer_email text,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT licenses_pkey PRIMARY KEY (license_key)
);
CREATE TABLE public.subscriptions (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  customer_id uuid,
  plan text,
  status text,
  current_period_start date,
  current_period_end date,
  allowed_seats integer DEFAULT 1,
  created_at timestamp with time zone DEFAULT now(),
  CONSTRAINT subscriptions_pkey PRIMARY KEY (id),
  CONSTRAINT subscriptions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id)
);