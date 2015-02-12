From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 3/3] clk: Replace explicit clk assignment with __clk_hw_set_clk
Date: Thu, 12 Feb 2015 17:12:39 +0100
Message-ID: <87oaoz5cso.fsf@free.fr>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk>
	<1423749510-14525-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:47343 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755543AbbBLQNA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 11:13:00 -0500
In-Reply-To: <1423749510-14525-4-git-send-email-javier.martinez@collabora.co.uk>
	(Javier Martinez Canillas's message of "Thu, 12 Feb 2015 14:58:30
	+0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emilio =?utf-8?Q?L=C3=B3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> The change in the clk API to return a per-user clock instance, moved
> the clock state to struct clk_core so now the struct clk_hw .core field
> is used instead of .clk for most operations.

If the patchset makes it up to acceptance by Mike or Stephen, the clk-pxa part
looks quite straightforward, so :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
