Return-Path: <SRS0=hDuM=27=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AF5C282DD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jan 2020 17:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0713F20882
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Jan 2020 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578677030;
	bh=bJ7uSsD1XdjwYUW0kN2RzidhFDTOge2H7C13hNoWdlU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ZJRzAWTPay3kkUXXTNGMDAxxn5OK8gw3Fql61iGIsm9pix1QzjoRBBde0071aeqyt
	 /pcv4/HRU18ntuli20MqV2aTbJYsZ+qvxLg8qpPMLKLcQ/esKJ8D0y4JbQycj64VHL
	 Er/Et4cql47IUvM4qUoPqI7uN2vPpH0SYRexzGk8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgAJRXt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Jan 2020 12:23:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:38512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgAJRXt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jan 2020 12:23:49 -0500
Received: from localhost.localdomain (unknown [83.218.167.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB891206ED;
        Fri, 10 Jan 2020 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578677028;
        bh=bJ7uSsD1XdjwYUW0kN2RzidhFDTOge2H7C13hNoWdlU=;
        h=From:To:Cc:Subject:Date:From;
        b=BU4Wcwnx0nkMXq9Pk3Zt3O8kDaE3+GH9VbRThsJaOH8a7utkjXCts3XO4Ffg1YAME
         Gwk9WLVa/1c25PI4L1JY+RtS2khz7tNP9CR2DV4m+DQbmN+3hoXbUBNZSR7lvkjdu/
         AGCTRS6MA3WSI1rrqIJOki89lgGhyh+Rn2FiOHsM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 0/3] ARM: Pull for v5.6
Date:   Fri, 10 Jan 2020 18:23:29 +0100
Message-Id: <20200110172334.4767-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Except three pull requests, also separate two patches
at the end - not worth its own pull.

Best regards,
Krzysztof
