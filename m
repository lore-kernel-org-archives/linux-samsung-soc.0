From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 3/4] PM / Domains: Improve error handling while
 adding/removing devices
Date: Wed, 5 Nov 2014 09:03:05 +0100
Message-ID: <CAPDyKFoA9oUOtKPvFB1Kex5-x7wn917EBUdv=jYyUwgFth4dvw@mail.gmail.com>
References: <1414507090-516-1-git-send-email-ulf.hansson@linaro.org>
	<1414507090-516-4-git-send-email-ulf.hansson@linaro.org>
	<CAMuHMdWMEaC3=ibf9E8dLcG=zceU5+oE9NnKyRfAM0O36cBAjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:37478 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753880AbaKEIDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Nov 2014 03:03:06 -0500
Received: by mail-qc0-f180.google.com with SMTP id o8so125826qcw.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Nov 2014 00:03:05 -0800 (PST)
In-Reply-To: <CAMuHMdWMEaC3=ibf9E8dLcG=zceU5+oE9NnKyRfAM0O36cBAjg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Linux PM list <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Kevin Hilman <khilman@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jack Dai <jack.dai@rock-chips.com>

On 5 November 2014 08:47, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Oct 28, 2014 at 3:38 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>> --- a/drivers/base/power/domain.c
>> +++ b/drivers/base/power/domain.c
>> @@ -1358,25 +1358,81 @@ EXPORT_SYMBOL_GPL(pm_genpd_syscore_poweron);
>>
>>  #endif /* CONFIG_PM_SLEEP */
>>
>> -static struct generic_pm_domain_data *__pm_genpd_alloc_dev_data(struct device *dev)
>> +static int genpd_alloc_dev_data(struct generic_pm_domain *genpd,
>> +                               struct device *dev, struct gpd_timing_data *td)
>>  {
>
> [...]
>
>> +       if (genpd->attach_dev)
>> +               genpd->attach_dev(dev);
>
> Note that dev->pm_domain is not yet set at this point, so the callee
> can no longer
> know to which domain the device is being attached.
> Should we re-add the parameter, or move the attach_dev() back to
> __pm_genpd_add_device(), like Kevin suggested.

I agree.

I am working on a new version, which adopts to your suggestions.

Kind regards
Uffe
