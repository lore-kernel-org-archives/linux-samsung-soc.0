From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/5 v2] Rename s5p-time to samsung-time
Date: Tue, 08 Jan 2013 22:00:06 +0100
Message-ID: <6825637.7rn5o5FT8e@flatron>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:51103 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349Ab3AHVAI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jan 2013 16:00:08 -0500
Received: by mail-ee0-f41.google.com with SMTP id d41so451102eek.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jan 2013 13:00:07 -0800 (PST)
In-Reply-To: <50CCEEE7.4090203@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Naour <romain.naour@openwide.fr>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Hi Romain,

On Saturday 15 of December 2012 22:43:03 Romain Naour wrote:
> Le 10/12/2012 13:59, Heiko St=FCbner a =E9crit :
> > Am Sonntag, 2. Dezember 2012, 20:44:01 schrieb Romain Naour:
> >> This patch rename s5p-time to samsung-time.
> >> There is no functional change.
> >>=20
> >>=20
> >> Signed-off-by: Naour Romain <romain.naour@openwide.fr>
> >=20
> > The patch does not apply to current linux-next, because it has some
> > problem with the exynos-universal board. I've fixed this to test th=
e
> > patch, so
> >=20
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
> What's wrong with this part of the patch ?
> I applied this patch today on linux-next tree, branch next-20121214.
> (with some hunk but no error)

Patches that are supposed to go through Samsung (Kgene's) tree, should =
be=20
based on for-next branch of Samsung tree.

Do you have plans to rebase and resubmit this series again? I plan to=20
submit some patches for S3C64xx (partly based on my historical work on=20
this platform) and would be nice to have hrtime support already there,=20
especially when all left is to just merge it.

Best regards,
Tomasz Figa
