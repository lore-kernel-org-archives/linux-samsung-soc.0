From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: s3c2442: gta02: Fix usage gpio bank j pin definitions
Date: Mon, 27 Sep 2010 01:13:42 +0100
Message-ID: <4C9FE1B6.2060005@fluff.org>
References: <1285352658-20355-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:46281 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753233Ab0I0ANq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Sep 2010 20:13:46 -0400
In-Reply-To: <1285352658-20355-1-git-send-email-lars@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 24/09/10 19:24, Lars-Peter Clausen wrote:
> The gta02 header file still uses the old S3C2410_GPJx defines instead of the
> S3C2410_GPJ(x) macro. Since the S3C2410_GPJx defines have already been removed
> this causes a build failure.
> This patches fixes the issue by doing a s,S3C2410_GPJ([\d]+),S3C2410_GPJ(\1),g
> on the file.

Is this currently causing a build error? If so, please add the snippet
of the build log. Otherwise it'll get queued for the next merge.
