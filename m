From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2] pwm: samsung: add missing s3c->pwm_id
Date: Fri, 14 Dec 2012 16:40:03 +0900
Message-ID: <50CAD7D3.8030300@samsung.com>
References: <1355468338-12611-1-git-send-email-jy0922.shim@samsung.com>
 <20121214073425.GC24094@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37951 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab2LNHjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 02:39:54 -0500
In-reply-to: <20121214073425.GC24094@avionic-0098.adnet.avionic-design.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

On 12/14/2012 04:34 PM, Thierry Reding wrote:
> On Fri, Dec 14, 2012 at 03:58:58PM +0900, Joonyoung Shim wrote:
>> The s3c->pwm_id is used to calculate offset of related register.
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> I've modified the subject a bit to make it clear the assignment of
> s3c->pwm_id was missing, not the s3c->pwm_id field altogether.
>
> Applied, thanks.

OK, thanks.
