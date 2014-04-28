From: armdev <armdev.ftm@gmail.com>
Subject: Bare metal Code to test Big Little on Arndale Octa (5420)
Date: Mon, 28 Apr 2014 11:21:16 +0530
Message-ID: <0DC06F23-1FB7-48D0-9341-8CE94A49060E@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33869 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751948AbaD1FvQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 01:51:16 -0400
Received: by mail-pd0-f178.google.com with SMTP id fp1so3184766pdb.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2014 22:51:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Tushar Behera <tushar.behera@linaro.org>

Hi,

We are trying a write a bare metal test code for Switching tasks from A15 Core to A7 core.
As of now we have this article to start with https://lwn.net/Articles/481055/.

Can the list help us in 
a) Where (file/directory ) in Linux kernel code that does the switching code (arch specific) for 5420 ?
b) Any test cases for big little on 5420 ?


-Regards
armdev team