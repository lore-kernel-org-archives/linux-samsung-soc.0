From: Nikiforov Alex <a.nikiforov@samsung.com>
Subject: Error during compile
Date: Mon, 15 Aug 2011 12:36:51 +0400
Message-ID: <j2alr4$6l4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:38857 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751469Ab1HOIpF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2011 04:45:05 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1Qssn9-0001Zl-8C
	for linux-samsung-soc@vger.kernel.org; Mon, 15 Aug 2011 10:45:03 +0200
Received: from 213.33.187.194 ([213.33.187.194])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 10:45:03 +0200
Received: from a.nikiforov by 213.33.187.194 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Aug 2011 10:45:03 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi All, I have some problem with building s5pv210 default config of 
latest kernel (git pull today in the morning). Any ideas?

make ARCH=arm s5pv210_defconfig
make clean
make -j5 ARCH=arm CROSS_COMPILE=..... uImage


SYSMAP  System.map
SYSMAP  .tmp_System.map
Inconsistent kallsyms data
This is a bug - please report about it
Try make KALLSYMS_EXTRA_PASS=1 as a workaround
make: *** [vmlinux] Error 1
