Return-Path: <SRS0=SgCN=7X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6002C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 13:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91AC2206F4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 13:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbgFJNSS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 09:18:18 -0400
Received: from foss.arm.com ([217.140.110.172]:58618 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbgFJNSR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 09:18:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75EDD1F1;
        Wed, 10 Jun 2020 06:18:16 -0700 (PDT)
Received: from [10.37.12.16] (unknown [10.37.12.16])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04CD73F66F;
        Wed, 10 Jun 2020 06:18:14 -0700 (PDT)
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        s.nawrocki@samsung.com
From:   Lukasz Luba <lukasz.luba@arm.com>
Subject: Question about Odroid XU4 cpuidle
Message-ID: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
Date:   Wed, 10 Jun 2020 14:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof, Bartek,

I recall that you have been working on some cpuidle code for Exynos(4?).

I have a question regarding CPUIdle driver for Odroid XU4.
I use the board with LISA tests for EAS, but missing at
least idle state 0 cause errors (please see the log below).

Currently the system does not report any idle driver and the state 0
is missing in: /sys/devices/system/cpu/cpu0/cpuidle/state0/

I am using driver CONFIG_ARM_BIG_LITTLE_CPUIDLE but the
boot stops silently while trying to init the cpu idle devices in there.
I carry on with a workaround that just removes idle state[1] and set
state_count=1 in the big and little structures.

Could you tell me if it needs some out-of-tree patches or maybe special
bootloader or it is not possible at all to have this driver working
properly? Or maybe I should use different driver on that board?

----------------->8--------------------------------
EXCEPTION (KeyError): 'No idle state with index 0'
----------------------------------------

################################################################################
[2020-06-08 17:53:51,333][EXEKALL] INFO  Artifacts dir: 
/data/llu/lisa/results/20200608_17:47:19_02627c97a1de40588d800f5b777eb9e3
[2020-06-08 17:53:51,334][EXEKALL] INFO  Result summary:
EnergyModelWakeMigration[board=odroidxu4]:test_task_placement 
UUID=b264d606c7164c8192eae59eb26d5104 EXCEPTION (KeyError): 'No idle 
state with index 0'
OneSmallTask[board=odroidxu4]:test_task_placement 
UUID=c95afb9d5ab84d4f9f945e8e9b87aaea EXCEPTION (KeyError): 'No idle 
state with index 0'
RampDown[board=odroidxu4]:test_task_placement 
UUID=6b9d7be94a43441c94d87543d612fde0 EXCEPTION (KeyError): 'No idle 
state with index 0'
RampUp[board=odroidxu4]:test_task_placement 
UUID=7a60af8c17344214bd8602ac24767976 EXCEPTION (KeyError): 'No idle 
state with index 0'
ThreeSmallTasks[board=odroidxu4]:test_task_placement 
UUID=25ec227753ce4ac3b409c88e7a8f9d78 EXCEPTION (KeyError): 'No idle 
state with index 0'
TwoBigTasks[board=odroidxu4]:test_task_placement 
UUID=9e8b9148685748ed9d632912fc83f4ba EXCEPTION (KeyError): 'No idle 
state with index 0'
TwoBigThreeSmall[board=odroidxu4]:test_task_placement 
UUID=a0c98621f160400fb5487d8db1c69f95 EXCEPTION (KeyError): 'No idle 
state with index 0'

----------------8<--------------------------------------------------

I appreciate your advice.

Regards,
Lukasz
