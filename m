From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: [PATCH v2 2/4] S3C: sdhci: Update sdhci platform data.
Date: Fri, 16 Oct 2009 11:00:58 +0200
Message-ID: <op.u1vxzwa17p4s8u@localhost>
References: <1255586371-28042-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23898 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460AbZJPJMt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Oct 2009 05:12:49 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KRL001NGNQEN4@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Oct 2009 10:01:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRL00KDRNQEGU@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Oct 2009 10:01:26 +0100 (BST)
In-reply-to: <1255586371-28042-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, 15 Oct 2009 07:59:31 +0200, Thomas Abraham <thomas.ab@samsung.c=
om> wrote:
[...]
> diff --git a/arch/arm/plat-s3c/include/plat/sdhci.h b/arch/arm/plat-s=
3c/include/plat/sdhci.h
> index f615308..722969d 100644
> --- a/arch/arm/plat-s3c/include/plat/sdhci.h
> +++ b/arch/arm/plat-s3c/include/plat/sdhci.h
[...]
> @@ -133,6 +141,11 @@ static inline void s3c6410_default_sdhci0(void) =
{ }
>  static inline void s3c6410_default_sdhci1(void)
>  {
>  	s3c_hsmmc1_def_platdata.clocks =3D s3c6410_hsmmc_clksrcs;
> +	strcpy((void *)s3c_hsmmc0_def_platdata.clk_parent_name,
> +			(void *)"dout_mpll");
> +	strcpy((void *)s3c_hsmmc0_def_platdata.clk_source_name,
> +			(void *)"mmc_bus");
> +	s3c_hsmmc0_def_platdata.clk_speed =3D 50 * MHZ;
>  	s3c_hsmmc1_def_platdata.cfg_gpio =3D s3c64xx_setup_sdhci1_cfg_gpio;
>  	s3c_hsmmc1_def_platdata.cfg_card =3D s3c6410_setup_sdhci0_cfg_card;
>  }

Obviously this should read (note hsmmc1 instead of hsmmc0):

+	strcpy((void *)s3c_hsmmc1_def_platdata.clk_parent_name,
+			(void *)"dout_mpll");
+	strcpy((void *)s3c_hsmmc1_def_platdata.clk_source_name,
+			(void *)"mmc_bus");
+	s3c_hsmmc1_def_platdata.clk_speed =3D 50 * MHZ;

--=20
Best regards,                                           _     _
  .o. | Liege of Serenely Enlightened Majesty of       o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz     (o o)
  ooo +---<mina86@mina86.com>---<mina86@jabber.org>---ooO--(_)--Ooo--
