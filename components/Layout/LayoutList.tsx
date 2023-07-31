import AppLayout from "@/components/Layout/AppLayout/Layout";
import HomeLayout from "@/components/Layout/HomeLayout/Layout";
import OnboardingLayout from "@/components/Layout/OnboardingLayout/Layout";
import { NextComponentType, NextPage, NextPageContext } from "next";
import { AppProps } from "next/app";

export const Layouts = {
  HOME: HomeLayout,
  APP: AppLayout,
  ONBOARDING: OnboardingLayout,
};

export type LayoutKeys = keyof typeof Layouts;

// eslint-disable-next-line @typescript-eslint/ban-types
export type PageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  Layout?: LayoutKeys;
};

export type PageWithLayoutProps = AppProps & {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Component: NextComponentType<NextPageContext, any, any> & {
    Layout: LayoutKeys;
  };
};
