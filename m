From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv6 2/4] ARM: dts: exynos5422-odroidxu3: Enable TMU at
 Exynos5422 base
Date: Mon, 15 Jun 2015 07:53:26 +0530
Message-ID: <CANAwSgTOY3MECYLTjgmfSo5WrRuNycSSet2ZDhNTb-=gy8DGYQ@mail.gmail.com>
References: <1434277445-5243-1-git-send-email-linux.amoon@gmail.com>
 <1434277445-5243-2-git-send-email-linux.amoon@gmail.com> <557E181C.7070209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557E181C.7070209-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

hi Krzysztof

On 15 June 2015 at 05:41, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 14.06.2015 19:24, Anand Moon wrote:
>> This changes enables TMU IP block on the Exynos5422 Odroid-XU3
>> device.
>>
>> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Tested-by: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
>
> This does not look right.
> You put this "Tested-by" since beginning of this patchset (v1) but first
> it was LDO10. Then you proposed LDO18 and now you use LDO7 from my
> suggestion. Which of this was tested by Markus because I cannot find his
> emails with it on LKML?

Markus Reichl tested the earlier version with LDO10.
Commit logs got carry forward by mistake.

-Anand Moon

>
> Krzysztof
>
>> Acked-by: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Changes rebase on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung branch for-next
>> Changes from v5: Use LDO7 regulator instead of LD010.
>>
>> The output of LDO18 goes to VDD_EMMC_1V8. This is not regulator for TMU.
>>
>> I think the schematics are missing some of details but it can be deducted that:
>> 1. TEMP SE is supplied by VDD18_TS power domain. It consists of 5
>> pairs of pins (XTSTEST_OUT[0-4], XTSEXT_RES[0-4]).
>> 2. The VDD18_TS01, VDD18_TS23 and VDD18_TS4 are wired to the LDO7 of
>> S2MPS11 PMIC.
>> 3. I confirmed with the Exynos5422 datasheet that these
>> VDD18_TS{01,23,4} supply the XTSTEST pins (OUT and RES).
>>
>> So the LDO7 it is... but before using it there is a caveat. The LDO7
>> is also connected to VDD of MIPI, HDMI and few more. So when you use
>> this regulator in TMU it may be turned off by TMU driver (e.g. during
>> unbind). In such case these other blocks also should be tested and
>> checked whether they take this regulator and enable it.
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
