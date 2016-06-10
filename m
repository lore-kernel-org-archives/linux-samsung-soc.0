From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 07/15] ARM: exynos: fixup debug macros for big-endian
Date: Fri, 10 Jun 2016 13:16:35 +0200
Message-ID: <575AA193.7040907@samsung.com>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-8-matthew@mattleach.net>
 <ab51fcde-dfee-a70c-53c4-09485bfa7669@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19223 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbcFJLQl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 07:16:41 -0400
In-reply-to: <ab51fcde-dfee-a70c-53c4-09485bfa7669@codethink.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, Matthew Leach <matthew@mattleach.net>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 06/10/2016 01:12 PM, Ben Dooks wrote:
> On 08/06/16 19:31, Matthew Leach wrote:
>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>
>> The exynos low-level debug macros need to be fixed if the system is being
>> built big endian. Add the necessary endian swaps for accessing the registers
>> to get output working again
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>  arch/arm/include/debug/samsung.S | 8 ++++++++
>>  1 file changed, 8 insertions(+)
> 
> Should this go via the maintainer or to RMK?
> 
> If to RMK, then shall I get it submitted (and does anyone else
> want to ack?)

If there are no objections, I can take it through samsung-soc with other
arch/arm/mach-exynos* patches.

What I am missing here, is Matthew's Signed-off-by.

Matthew, you touched and sent the patch so could you add the Sob?

Best regards,
Krzysztof
