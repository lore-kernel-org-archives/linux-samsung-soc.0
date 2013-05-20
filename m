From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] clk: samsung: add composite clocks
Date: Mon, 20 May 2013 23:49:29 +0530
Message-ID: <CAPdUM4Nz8LL5xvvEOVBdd7NDSyQ2+FesnYRnBuQVeGK4gRE_yQ@mail.gmail.com>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
	<201305201614.31103.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:35992 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755440Ab3ETSTa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 14:19:30 -0400
Received: by mail-we0-f171.google.com with SMTP id t59so1086514wes.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 11:19:29 -0700 (PDT)
In-Reply-To: <201305201614.31103.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com

On Mon, May 20, 2013 at 7:44 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:
> Am Montag, 20. Mai 2013, 16:17:06 schrieb Rahul Sharma:
>> This patch adds support for composite clocks for samsung SoCs.
>> Many drivers need access to a common clock which support gating
>> and/or muxing and/or rate control operations. For example hdmi
>> which needs to switch between parents and call enable/disable for
>> "sclk_hdmi".
>>
>> This patch set also adds composite clock for exyno5250 hdmi. Based
>> on the review comment, I will extended this to other exynos SoCs
>> clocks files.
>
> I think I remember reading somewhere that the target of the common cl=
ock
> framework was to prevent every SoC from introducing their own special=
 clock
> types and instead  create these structures from separate clocks (mux =
clk +
> gate clk) and not to have every SoC create their own custom clock typ=
es.
>
> The Samsung clock drivers at the moment follow this paradigm of combi=
ning the
> existing "simple" clocks and only introduce new clock types for the p=
ll
> clocks, that really need special handling.
>
> So it would probably good to keep it this way and define your clocks =
from
> their individual components, as all the other Samsung clocks currentl=
y do.
>

Thanks Heiko, I agree, but I am not trying to introduce a new type here=
,
instead using the existing generic support for composite clocks for
exynos as well.

These have not been added for Samsung SoCs so far but I do not see any
harm in using them also. With them, drivers do not need to get and conf=
igure
each clock component separately. This ensures less and more reasonable
changes in the drivers during migration to CCF.

Please help me understand about the loss when using composite clocks.

regards,
Rahul Sharma

>
> Heiko
