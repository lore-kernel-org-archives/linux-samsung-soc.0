From: D Krishna Mohan <krishna.md@samsung.com>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is
 disabled
Date: Wed, 26 Nov 2014 14:26:07 +0530
Message-ID: <F186754307084FE3B13FB03E93EF318A@sisodomain.com>
References: <1416828162-8216-1-git-send-email-krishna.md@samsung.com>
 <20141124170409.GF7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=iso-8859-1; reply-type=original
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31295 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbaKZI4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 03:56:01 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFN00E8H25BN0B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Nov 2014 17:55:59 +0900 (KST)
In-reply-to: <20141124170409.GF7712@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, Claude Youn <claude.youn@gmail.com>

FYI your Suggestion was:
"You need to add an ifdef around the struct (or perhaps a __maybey_unused 
type annotation if there's something suitable) for such configurations."

Following your suggestion I have sent a patch 
(187024b36c635bd454c1b1587b58c9439d3a46ad on your git, branch: rt5631 ) 
using ifdef which you have already applied.
Since there are more suggestion asking for second (__maybe_unused) method, I 
have sent another patch for which below is the link.

You may be applying the second patch on the already applied first patch. so 
I request you to apply only second patch in place of first and abandon first 
patch.


Already applied patch in your git: 
http://www.spinics.net/lists/linux-samsung-soc/msg39044.html  [pls remove 
this and instead apply the below mentioned patch]
Patch to apply: 
http://www.spinics.net/lists/linux-samsung-soc/msg39465.html


-Krishna

--------------------------------------------------
From: "Mark Brown" <broonie@kernel.org>
Sent: Monday, November 24, 2014 10:34 PM
To: "Krishna Mohan Dani" <krishna.md@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>; 
<linux-arm-kernel@lists.infradead.org>; <alsa-devel@alsa-project.org>; 
<kgene.kim@samsung.com>; "Claude Youn" <claude.youn@gmail.com>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is 
disabled

On Mon, Nov 24, 2014 at 04:52:42PM +0530, Krishna Mohan Dani wrote:
> Fixes the following compilation warning:
> Warning: 'rt5631_i2c_dt_ids' defined but not used - when DT is not used.

This doesn't apply, please check and resend.
 
