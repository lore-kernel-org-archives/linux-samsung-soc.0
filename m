From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Mon, 30 Jan 2012 21:21:41 +0100
Message-ID: <201201302121.42020.heiko@sntech.de>
References: <201201142209.58453.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:56680 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753699Ab2A3UVv convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jan 2012 15:21:51 -0500
In-Reply-To: <201201142209.58453.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Jones <davej@redhat.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Dron Gus <dron0gus@gmail.com>

Am Samstag 14 Januar 2012, 22:09:57 schrieb Heiko St=FCbner:
> The S3C2416/S3C2450 SoCs support two sources for the armclk.
>=20
> The first source is the so called armdiv which divides the msysclk do=
wn
> to provide necessary cpu rates. In this mode the core voltage must be
> always at 1.3V. The frequency from the armdiv is not allowed to be
> lower than the hclk frequency.
>=20
> In the second mode the armclk can be sourced directly from the hclk i=
n
> the so called "dynamic voltags scaling" (dvs) mode. Here the armdiv
> isn't used at all. Also in this mode the core voltage may be lowered.
> Existing hardware and tests with it suggest 1.0V as sufficient.
>=20
> When changing the clock source to the armdiv from the hclk, the SoC
> shows stability issues if the new frequency is higher than the curren=
t
> hclk frequency. Hence the driver always forces the armdiv to the hclk
> frequency before the source change and lets the cpufreq issue another
> set_target call for higher frequencies.
>=20
> To mark the hclk frequency as lower as the corresponding armdiv
> frequency it is set 1MHz below the real frequency. This lets the cpuf=
req
> framework change between 133MHz based on hclk and 133MHz based on arm=
div
> at will.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
ping?

Thanks
Heiko
