From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] S3C64xx: Fix S3C6400_EPLL_ MDIV_MASK, PDIV_MASK, and
	SDIV_MASK value
Date: Thu, 1 Oct 2009 22:19:16 +0900
Message-ID: <1b68c6790910010619q48026731n1e3f6c4e95d36849@mail.gmail.com>
References: <1254388968-28146-1-git-send-email-kgene.kim@samsung.com>
	 <1b68c6790910010342g5adbf658g7e68e1bbf486136e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:51939 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756139AbZJANTM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Oct 2009 09:19:12 -0400
Received: by qw-out-2122.google.com with SMTP id 3so37804qwe.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2009 06:19:16 -0700 (PDT)
In-Reply-To: <1b68c6790910010342g5adbf658g7e68e1bbf486136e@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Thu, Oct 1, 2009 at 7:42 PM, jassi brar <jassisinghbrar@gmail.com> w=
rote:
> On Thu, Oct 1, 2009 at 6:22 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
>> -#define S3C6400_EPLL_MDIV_MASK ((1 << (23-16)) - 1)
>> -#define S3C6400_EPLL_PDIV_MASK ((1 << (13-8)) - 1)
>> -#define S3C6400_EPLL_SDIV_MASK ((1 << (2-0)) - 1)
>> +#define S3C6400_EPLL_MDIV_MASK ((1 << (23-16+1)) - 1)
>> +#define S3C6400_EPLL_PDIV_MASK ((1 << (13-8+1)) - 1)
>> +#define S3C6400_EPLL_SDIV_MASK ((1 << (2-0+1)) - 1)
>> =C2=A0#define S3C6400_EPLL_MDIV_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0(16=
)
>> =C2=A0#define S3C6400_EPLL_PDIV_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0(8)
>> =C2=A0#define S3C6400_EPLL_SDIV_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0(0)
>
> dunno it it's a problem but please checkout it out ....
> http://git.kernel.org/?p=3Dlinux/kernel/git/broonie/sound-2.6.git;a=3D=
blob;f=3Darch/arm/plat-s3c64xx/include/plat/pll.h;h=3D90bbd72fdc4ef356b=
177722625c384f9fb2e474f;hb=3Dfor-2.6.33
Never mind. The patch seems fine.
--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
