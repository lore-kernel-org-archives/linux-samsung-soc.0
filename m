From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] [media] Remove references to non-existent PLAT_S5P
 symbol
Date: Tue, 07 Oct 2014 11:11:47 +0200
Message-ID: <5433AE53.1010807@samsung.com>
References: <1412611806-9346-1-git-send-email-s.nawrocki@samsung.com>
 <1412613395.8561.1.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18023 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753180AbaJGJLv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 05:11:51 -0400
In-reply-to: <1412613395.8561.1.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 06/10/14 18:36, Paul Bolle wrote:
> On Mon, 2014-10-06 at 18:10 +0200, Sylwester Nawrocki wrote:
>> > The PLAT_S5P Kconfig symbol was removed in commit d78c16ccde96
>> > ("ARM: SAMSUNG: Remove remaining legacy code"). However, there
>> > are still some references to that symbol left, fix that by
>> > substituting them with ARCH_S5PV210.
>> > 
>> > Reported-by: Paul Bolle <pebolle@tiscali.nl>
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Thanks for picking this up!
> 
> Should
>      Fixes: d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
> 
> be added so this will end up in stable for v3.17?

Thanks for the suggestion. I will add it to the commit description
and Cc stable before including the patch in a pull request to Mauro.
And will resend the other patch.

--
Regards,
Sylwester
