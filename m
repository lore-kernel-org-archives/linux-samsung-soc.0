From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: add cpu perf counters to Exynos54xx boards
Date: Mon, 30 Oct 2017 10:38:38 +0100
Message-ID: <CAJKOXPekn5JUmjcmcqT6HHQUbd7yCGC9mA-oPcEMRjTL0OvQ3g@mail.gmail.com>
References: <1508812196-14478-1-git-send-email-mihailescu2m@gmail.com> <CAM3PiRwqS21a-z6L0yqM0stUSnbKY9pdWKGJfpnyePQ3AZJqdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM3PiRwqS21a-z6L0yqM0stUSnbKY9pdWKGJfpnyePQ3AZJqdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marian Mihailescu <mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Willy Wolff <willy.mh.wolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 30, 2017 at 10:34 AM, Marian Mihailescu
<mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> Can I get feedback on this last patch?

Just six days passed... I'll take a look soon, it is not lost. But
anyway merge window is too close so I am not planning to take anything
more for upcoming release.

Best regards.
Krzysztof


>
> Thanks,
> Marian
> Either I've been missing something or nothing has been going on. (K. E. Gordon)
>
>
> On Tue, Oct 24, 2017 at 12:59 PM, memeka <mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Enable support for ARM Performance Monitoring Units available in Cortex-A7
>> and Cortex-A15 CPU cores for Exynos54xx SoCs (5410, 5420 and 5422/5800).
>>
>> The PMUs interrupts are defined in the common exynos54xx.dtsi device tree,
>> but the PMUs are enabled and have their interrupt CPU affinity defined
>> next to each SoC's cpus node.
>>
>> Tested with perf on Odroid XU4 (Exynos5422):
>> armv7_cortex_a7 PMU driver: 5 counters available
>> armv7_cortex_a15 PMU driver: 7 counters available
>>
>> Suggested-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Marian Mihailescu <mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Willy Wolff <willy.mh.wolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
