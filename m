From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [GIT PULL 6/7] Samsung cleanup fimd header for v3.7
Date: Fri, 21 Sep 2012 00:35:30 +0000
Message-ID: <505BB652.0@gmx.de>
References: <099d01cd96bd$2f625050$8e26f0f0$%kim@samsung.com> <20120920235949.GB13788@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:49081 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756656Ab2IUAfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 20:35:43 -0400
In-Reply-To: <20120920235949.GB13788@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Leela Krishna Amudala' <l.krishna@samsung.com>

Hi,

On 09/20/2012 11:59 PM, Olof Johansson wrote:
> On Thu, Sep 20, 2012 at 08:19:15AM +0900, Kukjin Kim wrote:
>> Hi Arnd, Olof.
>>
>> This is for moving header file is related to fimd from platform to
>> include/video.
>>
>> Since this touches many Samsung stuff, it is included in samsung tree and I
>> requested to pull into Florian's tree and he already agreed. So its name is
>> 'v3.7-for-florian'.
> 
> Hi,
> 
> So, it seems like there's no need to pull this through arm-soc; there are no
> conflicts with other patches as far as I can see, and it can just go in through
> Florian's tree.
> 
> Florian, if you want, you can add:
> 
> Acked-by: Olof Johansson <olof@lixom.net>
> 
> on the merge you do.

Works for me. I already merged it.


Best regards,

Florian Tobias Schandinat
