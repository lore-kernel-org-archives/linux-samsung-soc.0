From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: s3c2440 / s3c2416 broken
Date: Thu, 10 Nov 2011 05:44:59 +0530
Message-ID: <CAJuYYwTQ-eCN1pTkgrthhUEdk5gr9oGGcO6MCKCWQAovsQVqcg@mail.gmail.com>
References: <CAC=G6syKMJk+L+-_k+T37qHKzfpNz_TrYi-HTaufczLxJKEtkQ@mail.gmail.com>
	<CAC=G6swbDHZJ7fqu9LoYRiri6bg+M+VDZnG_-=ZfP9r=6YtVeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:63553 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977Ab1KJAPA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Nov 2011 19:15:00 -0500
Received: by ywf7 with SMTP id 7so2310647ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 16:14:59 -0800 (PST)
In-Reply-To: <CAC=G6swbDHZJ7fqu9LoYRiri6bg+M+VDZnG_-=ZfP9r=6YtVeg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Schilling <paul.s.schilling@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 10 November 2011 05:00, Paul Schilling <paul.s.schilling@gmail.com> =
wrote:
> Boot past init slow - stalled when using jffs2 also.
>
> On Wed, Nov 9, 2011 at 4:12 PM, Paul Schilling
> <paul.s.schilling@gmail.com> wrote:
>> Latest kernel 3.2.0-rc1 appears to break the following processors
>> s3c2440 and s3c2416
>>
>> both appear to stall when init is executed on NFS. =A0Also I =A0lost=
 HSMMC on
>> the s3c2416.

Could you post a boot log of the kernel on the s3c2440 and s3c2416 boar=
ds?

Thanks,
Thomas.

>>
>> Thanks,
>> Paul
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
