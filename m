From: Devarsh Thakkar <devarsh.thakkar@sibridgetech.com>
Subject: Arndale Octa  application on top of SPL not working
Date: Mon, 24 Nov 2014 12:41:19 +0530
Message-ID: <1416813079.4431.9.camel@devarsh.sibshivalik.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:59588 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbaKXHLk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:11:40 -0500
Received: by mail-pd0-f171.google.com with SMTP id y13so1188602pdi.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Nov 2014 23:11:40 -0800 (PST)
Received: from [192.168.1.70] ([202.131.115.146])
        by mx.google.com with ESMTPSA id fn5sm9399442pdb.55.2014.11.23.23.11.38
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Sun, 23 Nov 2014 23:11:39 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

Using Arndale Octa board from samsung ,Iam trying to develop an
application myapp which will be run on top of bl2 (SPL). I create my own
function(board_init_f()) for basic initialization (taking reference from
uboot),which includes UART configuration.After compiling my code I am
not getting any data over UART. 
When I replace u-boot.bin with my_app.bin it doesn't work.
But When I called my_app from u-boot.bin it works fine.

I am trying to load my_app.bin from SPL then it doesn't work 
What could be the problem? Please suggest if I am missing anything.

Thanks,
Devarsh
