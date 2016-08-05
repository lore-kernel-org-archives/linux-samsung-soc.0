From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 7/8] ASoC: samsung: s3c24xx_uda134x: debug/error trace
 cleanup
Date: Fri, 05 Aug 2016 11:52:06 +0200
Message-ID: <dc98210f-b87f-443c-f54f-1123f31c7ad3@samsung.com>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
 <1470317928-25365-8-git-send-email-s.nawrocki@samsung.com>
 <20160804210554.GL10383@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24977 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934722AbcHEJwT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 05:52:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBF006HOKR3KZ40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Aug 2016 10:52:15 +0100 (BST)
In-reply-to: <20160804210554.GL10383@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/04/2016 11:05 PM, Mark Brown wrote:
> On Thu, Aug 04, 2016 at 03:38:47PM +0200, Sylwester Nawrocki wrote:
>> Switch from pr_* to dev_* macros and drop some debug traces.
> 
> This doesn't apply against current code and the previous patch had
> unknown SHA1s suggesting that you've got some other patches in your
> tree, please check and resend.

I suspect the cause is this patch missing:
"ASoC: samsung: Fix clock handling in S3C24XX_UDA134X card"
which I really should have sent as a first one together with
this series. My apologies for the mess. 


I've resent $subject patch and will hold on for a moment with 
PATCH 8/8 as there are large conflicts when I first rebase it 
onto topic/samsung and then try to merge fix/samsung and 
topic/samsung to the for-next branch.
