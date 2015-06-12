From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 6/9] tests/exynos: remove struct fimg2d_test_case
Date: Fri, 12 Jun 2015 17:06:19 +0100
Message-ID: <CACvgo51saXm3of0S2n_AL61X7KaoarrA_=Cc75ri==P=KH8jGA@mail.gmail.com>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1433943748-15849-7-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:39438 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135AbbFLQGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 12:06:19 -0400
Received: by vnbg190 with SMTP id g190so6748978vnb.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2015 09:06:19 -0700 (PDT)
In-Reply-To: <1433943748-15849-7-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> It doesn't make sense to keep this structure, since we
> can just call all tests directly.
>
Seems like it was designed in mind of having another test case.
Perhaps the exynos guys cannot really upstream it (licensing or other
issues) ?

-Emil
