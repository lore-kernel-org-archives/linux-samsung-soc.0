From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 1/6] drm/exynos: remove leftover code using event_list
Date: Fri, 30 Jan 2015 11:37:59 -0200
Message-ID: <20150130133759.GA30820@joana>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <54CAEAC2.50709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:63994 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866AbbA3NiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 08:38:03 -0500
Received: by mail-qa0-f54.google.com with SMTP id w8so19865197qac.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2015 05:38:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54CAEAC2.50709@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, =?utf-8?B?IifrjIDsnbjquLAvTW9iaWxlIFMvVyBQbGF0Zm9ybSBMYWIuKO2GteyLoA==?= =?utf-8?B?7JewKS9FMyjsgqzsm5ApL+yCvOyEseyghOyekCci?= <inki.dae@samsung.com>

2015-01-30 Joonyoung Shim <jy0922.shim@samsung.com>:

> +Cc Inki,
> 
> Hi,
> 
> On 01/23/2015 09:42 PM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > The drm_file event_list hasn't been used anymore by exynos, so we don't
> > need any code to clean it.
> > 
> 
> No, it is used from drm core e.g. drm_irq.c file.

You are right, I'll drop this patch.

	Gustavo
