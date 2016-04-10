From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Sun, 10 Apr 2016 10:46:50 +0200
Message-ID: <20160410084650.GB9519@kozik-lap>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
 <20160407132947.GB3323@x1>
 <20160408035445.GA9532@kozik-lap>
 <20160408071721.GE3323@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35768 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbcDJIqz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Apr 2016 04:46:55 -0400
Content-Disposition: inline
In-Reply-To: <20160408071721.GE3323@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, Apr 08, 2016 at 08:17:21AM +0100, Lee Jones wrote:
> > Yes, this can be taken as is. Only second patch (changing defconfig)
> > depends on this. I can take the second patch through samsung tree but
> > that would require a tag/branch with this... which looks like an
> > overkill. So maybe you would take both?
> 
> If I take the defconfig patch without a tag, there will almost
> certainly be merge conflicts.  Other solutions include; delaying the
> defconfig patch for one cycle or trying to get it in post -rc1.

Let's wait for next cycle then. Anyway Javier added module-capability
to some other drivers as well so we can change all them at once.

Best regards,
Krzysztof
