From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: Improve Peach Pit and Pi power scheme
Date: Mon, 18 Aug 2014 23:43:49 +0200
Message-ID: <53F27395.5070601@collabora.co.uk>
References: <1407757091-18730-1-git-send-email-javier.martinez@collabora.co.uk> <CAD=FV=UbckfwGucuPjEtHixVgF5K2fD5N3EPS2BH96DRDACuqw@mail.gmail.com> <53F245A4.5010106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:41972 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbaHRVon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 17:44:43 -0400
In-Reply-To: <53F245A4.5010106@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Kukjin,

On 08/18/2014 08:27 PM, Kukjin Kim wrote:
> On 08/11/14 10:46, Doug Anderson wrote:
>>
> OK, I've applied this but 2nd in this series...
>

Thanks for picking this and yes PATCH 2/2 from this series was dropped.

>> Acked-by: Doug Anderson<dianders@chromium.org>
>>
> Thanks,
> Kukjin
> 

I've posted PATCH "mmc: core: Use regulator_get_voltage() if OCR mask is
empty." [0] instead to solve the issue that patch 2/2 tried to address.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/14/200
