From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 1 Aug 2012 13:18:53 +0530
Message-ID: <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
	<1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
	<033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:50105 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752160Ab2HAHsz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 03:48:55 -0400
Received: by lahd3 with SMTP id d3so4508470lah.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 00:48:53 -0700 (PDT)
In-Reply-To: <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com

On 1 August 2012 12:10, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Shaik Ameer Basha wrote:

[...]

>> +* Samsung Exynos5 Gscaler device
>> +
>> +Gscaler is used for scaling and color space conversion on EXYNOS5 SoCs.
>> +
>> +Required properties:
>> +- compatible: should be "samsung,exynos5250-gsc"
>
> IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can use
> same gscaler driver.

The compatible string should always be specific and it should clearly
identify the type of the controller. If there are other variants of
the GSC controller in previous of upcoming SoC's, then those
controllers will have a different compatible value.

This allows device drivers to know the type of the controller and
handle the differences among them. And, the node in the dts/dtsi file
should always claim compatibility to the base version of the
controller that the platform supports.

So the compatible value "samsung,exynos5250-gsc" is right one. If a
new SoC in the Exynos5 family has the same GSC controller as that in
Exynos5250 (no difference at all), then GSC device node in its dts
file can continue to claim compatibility to Exynos5250 type. The
"samsung,s3c2410-wdt is an example of this case which has been used on
all Samsung SoC's .

Thanks,
Thomas.
