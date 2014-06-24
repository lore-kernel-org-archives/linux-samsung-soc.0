From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/3] MCPM: clarify boot CPU situation wrt CCI
Date: Tue, 24 Jun 2014 00:11:08 -0400
Message-ID: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:28686 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147AbaFXELR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 00:11:17 -0400
Received: from yoda.home ([66.130.143.177]) by VL-VM-MR004.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0N7N00AF6NMRYHB3@VL-VM-MR004.ip.videotron.ca> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jun 2014 00:11:16 -0400 (EDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Doug Anderson <dianders@google.com>, Andrew Bresticker <abrestic@chromium.org>
Cc: Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org

For the background story, please see:

http://news.gmane.org/group/gmane.linux.kernel.samsung-soc/thread=32807

I sat on those patches for a while but they are the best I could think of
in terms of implementation.  To ease merging I suggest I collect all the
ACK's and Tested-by's and submit them all at once to RMK's patch system.


Nicolas
