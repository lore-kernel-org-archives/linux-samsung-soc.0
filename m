Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF46C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 20:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90D2E6105A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 20:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhHKUOy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 16:14:54 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:53674 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbhHKUOx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 16:14:53 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 73B3020B725E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/5] Correctly handle plaform_get_irq()'s result in the
 i2C drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>
CC:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        George Cherian <gcherian@marvell.com>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <83767306-be1b-3bcd-723c-92483b4cc612@omp.ru>
Organization: Open Mobile Platform
Message-ID: <cb7f1d92-7fdb-1ac9-a764-7f9996ba5742@omp.ru>
Date:   Wed, 11 Aug 2021 23:14:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <83767306-be1b-3bcd-723c-92483b4cc612@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 8/11/21 11:12 PM, Sergey Shtylyov wrote:

>> Here are 5 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
>> The affected drivers call platform_get_irq() but mis-interprete its result -- they consider
>> IRQ0 as error and (sometimes) the real error codes as valid IRQs... :-/
>>
>> [1/5] i2c: hix5hd2: fix IRQ check
>> [2/5] i2c: mt65xx: fix IRQ check
>> [3/5] i2c: pmcmsp: fix IRQ check
>> [4/5] i2c: s3c2410: fix IRQ check
>> [5/5] i2c: xlp9xx: fix main IRQ check
> 
>    Wolfram, hat's up with this series (its status in the patchwork is still "new")? 

   What's, of/c. :-)

MBR, Sergey

