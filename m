From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v2 1/3] rx1950: add battery device
Date: Sun, 26 Sep 2010 00:48:57 +0100
Message-ID: <4C9E8A69.8020000@simtec.co.uk>
References: <4C86C56B.7090204@fluff.org> <1283936292-10429-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:33307 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752679Ab0IYXtD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Sep 2010 19:49:03 -0400
In-Reply-To: <1283936292-10429-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 08/09/10 09:58, Vasily Khoruzhick wrote:
> v2: don't force usage of battery driver,
> use named initialisers in LUTs.

Any chance of more description here?


> +
> +static const struct s3c_adc_bat_thresh bat_lut_noac[] = {
> +	{
> +		.volt = 4100,
> +		.cur = 156,
> +		.level = 100
> +	},

In this case I'd say we may as well do the following
	{ .volt = 4100, .cur = 156, .level = 100 },

given there so many of them.

-- 
Ben
