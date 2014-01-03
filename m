From: John Dulaney <jdulaney@redhat.com>
Subject: USB broken on Exynos 5250 with 3.13-rc6 kernel
Date: Fri, 3 Jan 2014 17:00:01 -0500 (EST)
Message-ID: <920466999.35957290.1388786401864.JavaMail.root@redhat.com>
References: <736730464.35956872.1388786216775.JavaMail.root@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx3-phx2.redhat.com ([209.132.183.24]:48083 "EHLO
	mx3-phx2.redhat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbaACWAK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 17:00:10 -0500
In-Reply-To: <736730464.35956872.1388786216775.JavaMail.root@redhat.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Will Cohen <wcohen@redhat.com>, Jonathan Masters <jcm@redhat.com>

I build 3.13-rc6 for exynso-5250.  After installing the kernel and
rebooting my machine, everything worked (lpae out of the box, even)
except for usb; I rebuilt the kernel a couple of times, poking at
USB config options, but was completely unable to get USB to work.


-- 
John Dulaney, RHCE
IRC: handsome_pirate
jdulaney.wordpress.com
