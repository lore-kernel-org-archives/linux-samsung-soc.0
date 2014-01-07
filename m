From: VALETTE Eric OLNC/OLPS <eric2.valette@orange.com>
Subject: Unable to boot 3.13-rc7 on samsung exynos 5250 snow
Date: Tue, 07 Jan 2014 10:24:03 +0100
Message-ID: <52CBC7B3.1060102@orange.com>
Reply-To: eric2.valette@orange.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from r-mail2.rd.orange.com ([217.108.152.42]:21667 "EHLO
	r-mail2.rd.orange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754516AbaAGJeQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 04:34:16 -0500
Received: from r-mail2.rd.orange.com (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with SMTP id 84AE25D8852
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2014 10:24:04 +0100 (CET)
Received: from ftrdsmtp2.rd.francetelecom.fr (unknown [10.192.128.47])
	by r-mail2.rd.orange.com (Postfix) with ESMTP id 7C4E15D86F9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jan 2014 10:24:04 +0100 (CET)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I have been using a samsung snow chromebook using chromeos kernel source 
and debian unstable 64 bit user space for a while and would like to use 
upstream kernel instead of chomeos ones for testing virtualisation purpose.

I've followed the  virtual open system guide 
<http://www.virtualopensystems.com/media/chromebook/chromebook.pdf> 
using only binaries without regenerating them and it works fine. Uboot 
is on a CF a well as uImage and exynos5250-snow.dtb and I use my debian 
install on a USB hard disk as root file system.
Problem is that I have no WiFi and I need it.

I then tried to use the config they used to their kernel, installed 
3.13-rc7 sources and tried to make a make oldconfig and regenerate. I 
installed the uImage.new and exynos5250-snow.dt.new and make uboot load 
theses files instead of the old one but apparently resulting binaries 
does not boot (got only last line of uboot on screen). I may have goofed 
answering make oldconfig stuff but I did nothing special.

My questions are :
     1) Should 3.13-rc7 works directly on samsung exynos 5250 snow? 
Shoudl WiFi be supported
     2) What is the correct kernel config file?
     3) if answer to 1) is now, is there and upstream git tree for a 
kernel working on snow?
     4) Is there any specific problem using virtualopensystems uboot for 
upstream kernel?

Thanks for any hint.

PS: CC me I'm not subscribed.

-- eric
