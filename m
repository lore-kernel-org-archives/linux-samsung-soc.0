From: Ayaka <ayaka@soulik.info>
Subject: Re: [RFC PATCH v3 2/2] drm/panel: Add support for Chunghwa CLAA070WP03XG panel
Date: Wed, 7 Dec 2016 08:57:23 +0800
Message-ID: <2C9FE0C5-F521-48CD-B274-66128312CA75@soulik.info>
References: <1474311771-23321-1-git-send-email-ayaka@soulik.info> <1474311771-23321-3-git-send-email-ayaka@soulik.info> <20161206154625.GA28534@ulmo.ba.sec>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=big5
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:50346 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbcLGA5d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 19:57:33 -0500
In-Reply-To: <20161206154625.GA28534@ulmo.ba.sec>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, airlied@linux.ie, a.hajda@samsung.com, devicetree@vger.kernel.org



從我的 iPad 傳送

> Thierry Reding <thierry.reding@gmail.com> 於 2016年12月6日 下午11:46 寫道：
> 
>> On Tue, Sep 20, 2016 at 03:02:51AM +0800, Randy Li wrote:
>> The Chunghwa CLAA070WP03XG is a 7" 1280x800 panel, which can be
>> supported by the simple panel driver.
>> 
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>> .../display/panel/chunghwa,claa070wp03xg.txt       |  7 ++++++
>> drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>> 2 files changed, 34 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
> 
> Applied, thanks.
Wait, it is RFC, not pass the test.
> 
> Thierry
