From: christian pellegrin <chripell@gmail.com>
Subject: misc brokenness in v2.6.34-rc2 s3c24xx
Date: Fri, 26 Mar 2010 09:54:36 +0100
Message-ID: <cabda6421003260154u6a1ef6e5ia5f04f5e9cce77db@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f223.google.com ([209.85.220.223]:44913 "EHLO
	mail-fx0-f223.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059Ab0CZIyh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Mar 2010 04:54:37 -0400
Received: by fxm23 with SMTP id 23so1914793fxm.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Mar 2010 01:54:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

some time ago I sent a couple of patches that fix some bugs in s3c24xx
code (nand clock stop, suspend/resume gpio state preservation). I
started to work on 2.6.34-rcX and noticed they didn't make it to the
repository. Was there something wrong with the patches or with the
procedure for submitting them? Where can I monitor if the patches are
waiting in someone queue? Thanks.

-- 
Christian Pellegrin, see http://www.evolware.org/chri/
"Real Programmers don't play tennis, or any other sport which requires
you to change clothes. Mountain climbing is OK, and Real Programmers
wear their climbing boots to work in case a mountain should suddenly
spring up in the middle of the computer room."
