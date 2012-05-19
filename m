From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung cleanup-2 for v3.5
Date: Sat, 19 May 2012 16:11:37 -0700
Message-ID: <CAOesGMi_zNFAn4z162pzvRHHX3SQyi5qEkdi=7SZYE=-=mvHVQ@mail.gmail.com>
References: <4FB81E2A.1050806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:51637 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754872Ab2ESXLi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 19:11:38 -0400
Received: by obbtb18 with SMTP id tb18so5939593obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 16:11:38 -0700 (PDT)
In-Reply-To: <4FB81E2A.1050806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Sat, May 19, 2012 at 10:26 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> Please pull Samsung cleanup-2 for v3.5 from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-samsung-2
>
> It is including cleanup of s3c64xx-cpuidle to use new api and has no
> dependency with other branches.
>
> If any problems, please let me know.

I'm going to queue this in a late/cleanup branch. We will make a best
effort to get it in during the merge window but can't guarantee that
it happens.

If the merge window is cut short, or we end up having to deal with too
much merge conflicts or if we just run out of time to deal with it,
then this will have to be postponed to 3.6.


-Olof
