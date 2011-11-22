From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCH RESEND] drivers: i2c: s3c2410: add support for HDMIPHY
 dedicated controller
Date: Tue, 22 Nov 2011 11:48:30 +0100
Message-ID: <4ECB7DFE.3020509@samsung.com>
References: <1316687096-18307-1-git-send-email-m.szyprowski@samsung.com> <053a01cc8805$1cbec4a0$563c4de0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:53422 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752653Ab1KVKsy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 05:48:54 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1RSnuH-0000Rc-02
	for linux-samsung-soc@vger.kernel.org; Tue, 22 Nov 2011 11:48:53 +0100
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 11:48:52 +0100
Received: from t.stanislaws by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 11:48:52 +0100
In-Reply-To: <053a01cc8805$1cbec4a0$563c4de0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org

Hello Ben,
Recently, I've been asked a few times for help with S5P-TV drivers.
The problems were caused by HDMIPHY driver. The driver failed due to the 
lack of i2c-s3c2410 patch. Merging the patch is needed for HDMI support 
for S5P platform.

What is the current state of the patch?
Is it going to be merged in 3.3?

Best regards,
Tomasz Stanislawski

On 10/11/2011 01:01 PM, Kukjin Kim wrote:
> Marek Szyprowski wrote:
>>
>> From: Tomasz Stanislawski<t.stanislaws@samsung.com>
>>
>> This patch adds support for I2C HDMIPHY dedicated controller. It has
>> different timeout handling and reset conditions.
>>
>> Signed-off-by: Tomasz Stanislawski<t.stanislaws@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>
> Acked-by: Kukjin Kim<kgene.kim@samsung.com>
>
> Hi Ben,
>
> If you're ok with this, please apply this to go to upstream via your i2c
> tree.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
