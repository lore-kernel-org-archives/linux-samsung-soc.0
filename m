From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v5 03/14] clk: max77686: Add DT include for MAX77686 PMIC
 clock
Date: Fri, 27 Jun 2014 10:26:31 +0200
Message-ID: <53AD2AB7.1090000@suse.de>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk> <1403806546-31122-4-git-send-email-javier.martinez@collabora.co.uk> <53AD21E5.1030609@suse.de> <53AD22ED.5040303@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50622 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752606AbaF0I0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 04:26:37 -0400
In-Reply-To: <53AD22ED.5040303@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Javier,

Am 27.06.2014 09:53, schrieb Javier Martinez Canillas:
> Hello Andreas,
>=20
> On 06/27/2014 09:48 AM, Andreas F=E4rber wrote:
>> Am 26.06.2014 20:15, schrieb Javier Martinez Canillas:
>>> This patch adds a dt-binding include for Maxim 77686
>>> PMIC clock IDs that can be to be shared between the
>>
>> "can be shared"?
>>
>=20
> As it should be quite clear right now I'm not a native English speake=
r.

Guessed so, me neither. But since it's v5 already and no native speaker
pointed it out, I took the liberty to do so while verifying that the
LD02 typo didn't propagate into your bindings documentation (it didn't)=
=2E

> I meant
> that the header file can be included by both Device Tree source files=
 and the
> max77802 driver.

AFAIU "clock IDs to be shared" and "clock IDs that can be shared" would
both be valid, but above a verb is missing (e.g., "can be used to").

Thanks for your upstreaming efforts, and don't let me discourage you.

Best regards,

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
