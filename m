From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 3/4] rtc: s3c: use unified functions for enable/disable of
 clk
Date: Wed, 12 Aug 2015 19:26:52 +0900
Message-ID: <55CB1F6C.4080207@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
 <1439292502-22912-3-git-send-email-jy0922.shim@samsung.com>
 <55CA8EDE.8000006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38653 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbbHLK0w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 06:26:52 -0400
In-reply-to: <55CA8EDE.8000006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com

On 08/12/2015 09:10 AM, Krzysztof Kozlowski wrote:
> On 11.08.2015 20:28, Joonyoung Shim wrote:
>> The driver uses clk_prepare_enable()/clk_disable_unprepare() only in
>> probe only, elsewhere, use the unified functions for enable/disable of
>> clk, e.g. s3c_rtc_enable_clk() / s3c_rtc_disable_clk(), so it's better
>> to use them for consistency of code.
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> ---
>>  drivers/rtc/rtc-s3c.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> First of all - the code is larger (9 insertions, 5 deletion) so I have
> doubts if this is better.
> 
> Second - this is not equivalent change. The s3c_rtc_enable_clk/disable
> calls grab spin lock which is not necessary in probe.
> 

I made this patch because of patch 4/4, but patch 4/4 should be removed
dependency from previous patches, so i will drop this patch.

Thanks.
