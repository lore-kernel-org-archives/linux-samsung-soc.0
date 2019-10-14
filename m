Return-Path: <SRS0=B52k=YH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DD2ECE58C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Oct 2019 03:57:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 991B720882
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Oct 2019 03:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfJND5E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 13 Oct 2019 23:57:04 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:46062 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbfJND5E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 13 Oct 2019 23:57:04 -0400
Received: by mail-io1-f69.google.com with SMTP id o11so24607401iop.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Oct 2019 20:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OuWAyTtmm63QQUGDPXR+DkHDOHPMuPnOWQaHNFnyLBY=;
        b=gMfR+o5RocnJVausRFHPUifL/bzCrvYurml4yUXXjh4v3DZ/5m5C0OlgZP/dUocLqf
         dewnoAmFshmFp6zoOCB39WACRApISaltQAlUZhVKGlTAvRZ/BNPJDvrVv8cLWEws7RT6
         sP5la+EnyAPPdVp+s9dkFUq+NaXh7+REcFbfuxe+hYaUgYboVUdiT5umB9dWNGVkD8IU
         2LXI/sQ+UxzNDITQ5EqFNq0XQxeq3m+ifx5iXlmFHM41IFWEuJDQw9SHrC2DtSmhegVl
         PksiXG+Q9NMOgWLPBunql3VObbYQC77piXyxc65WhrS6iN/h5saIdm/EHtA6swI+zXrN
         G9CA==
X-Gm-Message-State: APjAAAWosv9/09UUpVRlw8WU5jzq4+WHCfMsdUry6o/HZom2j7kxq0V3
        OEFGX8wQRa3aWVN/H8F1OiRh9lQ/m+PaTvFknMsXHbSOXShD
X-Google-Smtp-Source: APXvYqwVwyIy9nSYbsyJl/5Ky7DslcWs3entkTykv54QRnqMyvOOoULUzhOD3mtwNZ2fJRFRwM9mAxsY/zpxHu8l3i0Nylw2l3P/
MIME-Version: 1.0
X-Received: by 2002:a5d:93c7:: with SMTP id j7mr6139939ioo.167.1571025421311;
 Sun, 13 Oct 2019 20:57:01 -0700 (PDT)
Date:   Sun, 13 Oct 2019 20:57:01 -0700
In-Reply-To: <00000000000059b6d40594d0f776@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002ba5570594d6dc99@google.com>
Subject: Re: WARNING in batadv_iv_send_outstanding_bat_ogm_packet
From:   syzbot <syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com>
To:     a@unstable.cc, akpm@osdl.org, arvind.yadav.cs@gmail.com,
        b.a.t.m.a.n@lists.open-mesh.org, davem@davemloft.net,
        kgene@kernel.org, krzk@kernel.org, kyungmin.park@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        mareklindner@neomailbox.ch, mchehab@kernel.org,
        mchehab@s-opensource.com, mingo@kernel.org, netdev@vger.kernel.org,
        oleg@tv-sign.ru, roland@redhat.com, s.nawrocki@samsung.com,
        sven@narfation.org, sw@simonwunderlich.de,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"; delsp="yes"; format="flowed"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191014035701.1VRUBDSaqsVThwIEefO_Gie4MQQIOgAFjmjmCOt_ABs@z>

syzbot has bisected this bug to:

commit 26d051e301f67cdd2ea3404abb43902f13214efa
Author: Arvind Yadav <arvind.yadav.cs@gmail.com>
Date:   Thu Jun 29 08:21:35 2017 +0000

     media: exynos4-is: fimc-is-i2c: constify dev_pm_ops structures

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a0aff0e00000
start commit:   da940012 Merge tag 'char-misc-5.4-rc3' of git://git.kernel..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12a0aff0e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a0aff0e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d2fd92a28d3e50
dashboard link: https://syzkaller.appspot.com/bug?extid=c0b807de416427ff3dd1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141ffd77600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11edd580e00000

Reported-by: syzbot+c0b807de416427ff3dd1@syzkaller.appspotmail.com
Fixes: 26d051e301f6 ("media: exynos4-is: fimc-is-i2c: constify dev_pm_ops  
structures")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
