From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: [PATCH 1/5 v2] Rename s5p-time to samsung-time
Date: Wed, 09 Jan 2013 23:43:21 +0100
Message-ID: <50EDF289.2060806@openwide.fr>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de> <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron> <50EDC45F.5010105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:50245 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758090Ab3AIWnZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 17:43:25 -0500
In-Reply-To: <50EDC45F.5010105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Le 09/01/2013 20:26, Kukjin Kim a =E9crit :
> On 01/08/13 13:00, Tomasz Figa wrote:
>> Hi Romain,
>=20
> [...]
>=20
>>> What's wrong with this part of the patch ?
>>> I applied this patch today on linux-next tree, branch next-20121214=
=2E
>>> (with some hunk but no error)
>>
>> Patches that are supposed to go through Samsung (Kgene's) tree, shou=
ld be
>> based on for-next branch of Samsung tree.
>>
>> Do you have plans to rebase and resubmit this series again? I plan t=
o
>> submit some patches for S3C64xx (partly based on my historical work =
on
>> this platform) and would be nice to have hrtime support already ther=
e,
>> especially when all left is to just merge it.
>>
> Tomasz, thanks.
>=20
> As I said, this looks good to me, but, please re-submit this series
> against on latest my for-next so that I can pick up in Samsung tree. =
I
> couldn't apply due to too many conflicts :-(
>=20
> One more note, please add config option and inclusion by alphabetical
> order rather than just replacing them.
>=20
> Thanks.
>=20
> - Kukjin

Hi Kukjin and Tomasz,

I reapplied this series of patches onto for-next branch.
So, here are these patches in the following mails :)

Thank you for your help.
Romain
