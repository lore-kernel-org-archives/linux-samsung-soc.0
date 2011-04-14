From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 3/4] ARM: EXYNOS4: Add usb ehci device to the NURI board
Date: Thu, 14 Apr 2011 13:40:25 +0900
Message-ID: <4DA67AB9.2080107@samsung.com>
References: <1302236532-27636-1-git-send-email-jy0922.shim@samsung.com>
 <1302236532-27636-3-git-send-email-jy0922.shim@samsung.com>
 <20110413235402.GA32159@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11881 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637Ab1DNEke (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 00:40:34 -0400
In-reply-to: <20110413235402.GA32159@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@suse.de, kyungmin.park@samsung.com, jg1.han@samsung.com

On 2011-04-14 =EC=98=A4=EC=A0=84 8:54, Greg KH wrote:
> On Fri, Apr 08, 2011 at 01:22:11PM +0900, Joonyoung Shim wrote:
>> This patch is to support usb ehci device to the NURI board.
>>
>> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>
> Note, I had to apply this one by hand, I don't know what tree you mad=
e
> it against.  Hopefully the merge issues will be simple to handle, as
> they were pretty obvious to me.
>

This patch is based from for-next branch of linux-samsung tree
(git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git)=
,
so will occur merge conflict at the your usb tree.

Sorry for missing about tree.
