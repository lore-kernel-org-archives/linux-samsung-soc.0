From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/3] Add support I2C devices on SMDK6440, SMDKC110 and
	SMDKV210
Date: Fri, 16 Jul 2010 22:39:32 +0900
Message-ID: <AANLkTinRtiRcfTteZR-OkmLpL1oSpEmsKf0MWDj89AUH@mail.gmail.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:59597 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965295Ab0GPNjd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 09:39:33 -0400
In-Reply-To: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org

Maybe it requires the s5pc210(s5pv310) support also.
As you know s5pc210 has 8 I2Cs. the problem is that current
implementation need each i2c device gpio setup and Kconfig
Do you think it's reasonable?

I think we need to find a good way to solve this issue. do you have any=
 idea?

Thank you,
Kyungmin Park

On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> This patches is to support I2C devices on SMDK6440, SMDKC110 and SMDK=
V210.
> S5P6440 can support I2C channel 0 and 1, and S5PV210/S5PC110 can supp=
ort
> I2C channel 0, 1 and 2.
>
> [PATCH 1/3] ARM: S5P6440: Add support for I2C channel 0 and 1 on SMDK=
6440
> [PATCH 2/3] ARM: S5PV210: Add support for I2C devices on SMDKV210 and=
 SMDKC110
> [PATCH 3/3] i2c/busses: Select I2C bus support for S5PV210 and S5P644=
0.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
