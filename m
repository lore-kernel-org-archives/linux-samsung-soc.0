From: Dai Otsuka <dai.otsuka@positive-one.com>
Subject: S3C6410 USB OTG2.0 Host?
Date: Wed, 09 Mar 2011 04:29:40 +0900
Message-ID: <4D7683A4.2010206@positive-one.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www497.sakura.ne.jp ([59.106.13.147]:58607 "EHLO
	www497.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932138Ab1CHUR6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 15:17:58 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, Dai Otsuka <dai.otsuka@positive-one.com>

Greeting,

I know your information below.
http://lwn.net/Articles/392313/

I would like to help.
Where should I talk for S3C6410? Also, I hope to get sample for USB 
OTG2.0 Host....

I am  testing the image transfer on S3C6410 board on the computer. Then, 
I send a data flow as follows.

Analog data -> FIMC-> Digital YUV4: 2:2 (8bit) -> encoding -> USB-> 
display (XGA)

Regarding the results, XGA display the occasion of the show, it had a 
handicap.

I think one problem, USB Host1.1 on S3C6410 slow down the frame-rate. In 
fact, It send three packets in one micro-frame.

I think another one program in Linux version. this hardware is working 
Linux2.6.29. But Samsung is the latest version is 2.6.36. Maybe, I 
cannot afford to update new version soon.

I knew that it is different structures in FIMC. I must optimize FIMC and 
drivers in new version. It must have much time.

I would like to have hight performance of image transfer in this 
environment. Please have your idea.

Thanks in advance,
Dai Otsuka
