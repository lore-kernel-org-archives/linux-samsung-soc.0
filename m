From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 1/5] include/video: Add samsung FIMD register header
Date: Wed, 01 Aug 2012 11:10:47 +0900
Message-ID: <02f101cd6f8a$dd923910$98b6ab30$%kim@samsung.com>
References: <1343737385-23337-1-git-send-email-l.krishna@samsung.com>
 <1343737385-23337-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62621 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753531Ab2HACKt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 22:10:49 -0400
In-reply-to: <1343737385-23337-2-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, inki.dae@samsung.com, joshi@samsung.com, jg1.han@samsung.com, m.szyprowski@samsung.com

Leela Krishna Amudala wrote:
> 
> This patch copies the contents from regs-fb-v4.h and regs-fb.h to
> include/video/samsung_fimd.h
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  include/video/samsung_fimd.h |  526
> ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 526 insertions(+), 0 deletions(-)
>  create mode 100644 include/video/samsung_fimd.h
> 
Firstly, please check my comment on your previous patches.

And I don't see following definitions are needed and used now. If some
definitions are not needed, they can be removed.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
