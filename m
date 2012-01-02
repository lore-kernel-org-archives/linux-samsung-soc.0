From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC][PATCH 1/4] lcd: platform-lcd: Eliminate need for
	platform data
Date: Mon, 2 Jan 2012 18:13:15 +0000
Message-ID: <20120102181313.GA27875@opensource.wolfsonmicro.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org> <1325483675-21908-2-git-send-email-thomas.abraham@linaro.org> <20120102115959.GG2899@opensource.wolfsonmicro.com> <CAJuYYwQrfp6R=kSzXr6y0unDk9FtNxoy3Lt5QabdNMg9Qux=bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:45023 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753076Ab2ABSNS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 13:13:18 -0500
Content-Disposition: inline
In-Reply-To: <CAJuYYwQrfp6R=kSzXr6y0unDk9FtNxoy3Lt5QabdNMg9Qux=bg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

On Mon, Jan 02, 2012 at 11:21:46PM +0530, Thomas Abraham wrote:

> Your point on maintaining support for both old and new formats is
> helpful. But I am not sure if maintaining support for both formats is
> the right thing to do. As most of the ARM platforms will switch to
> using dt, maybe converting all of them to new format would be better.
> I will try doing this and prepare a patch.

There's more architectures than ARM supported in Linux and only a
minority of them are using device tree at the minute.  Unless every
architecture switches over platform data based users will still need to
be supported.
