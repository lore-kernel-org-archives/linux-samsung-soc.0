From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] arch/arm/mach-s5pv210: adding ifdef CONFIG_CPU_S5PV210
 to fix compiling issue
Date: Mon, 07 Jan 2013 20:02:28 +0800
Message-ID: <50EAB954.4090504@asianux.com>
References: <50EA972E.3040404@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:31357 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753493Ab3AGMBg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 07:01:36 -0500
In-Reply-To: <50EA972E.3040404@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

=D3=DA 2013=C4=EA01=D4=C207=C8=D5 17:36, Chen Gang =D0=B4=B5=C0:
>=20
> =20
> +#ifdef CONFIG_CPU_S5PV210
> +
>  struct bus_type s5pv210_subsys =3D {
>  	.name		=3D "s5pv210-core",
>  	.dev_name	=3D "s5pv210-core",

  sorry, it is my fault.
    should let s5pv210_subsys outside of #ifdef CONFIG_CPU_S5PV210.
    it is used in pm.c

  I need send patch v2.


--=20
Chen Gang

Asianux Corporation
