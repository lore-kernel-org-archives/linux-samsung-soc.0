From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 26 Dec 2011 17:30:50 +0530
Message-ID: <CAK9yfHx3kJPi5NEh_UNuDAXaiAH1VhJyAO_t5hpMCz4eJY8JBQ@mail.gmail.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
	<1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
	<20111226115411.GA17760@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:37604 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755232Ab1LZMAv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 07:00:51 -0500
Received: by qcqz2 with SMTP id z2so6533120qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 04:00:50 -0800 (PST)
In-Reply-To: <20111226115411.GA17760@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Mark,

Thank you for your review comments.

On 26 December 2011 17:24, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Dec 26, 2011 at 03:30:12PM +0530, Sachin Kamat wrote:
>> This patch adds support for FIMC 0, 1 and 2 on SMDKV210 board.
>
> Why does this not also apply to the Aquilla, Gony and Torbreck machin=
es?

=46IMC is already enabled in Aquila and Goni machines.
I was not sure if it is required in Torbreck.

>
>> =A0 =A0 =A0 &s3c_device_wdt,
>> + =A0 =A0 &s5p_device_fimc0,
>> + =A0 =A0 &s5p_device_fimc1,
>> + =A0 =A0 &s5p_device_fimc2,
>> =A0 =A0 =A0 &s5p_device_mfc,
>
> The support consists solely of adding them to the lists of devices,
> there's no visible per board hookup here.

Yes.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
With warm regards,
Sachin
