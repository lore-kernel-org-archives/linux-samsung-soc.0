From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Tue, 24 Feb 2015 14:39:11 +0100
Message-ID: <f6d45cc1b5bcc8d3a6a3672cd953113a@math.uni-bielefeld.de>
References: <54D779FB.9070306@math.uni-bielefeld.de>
 <54D86913.2050109@samsung.com> <54D9185A.10607@math.uni-bielefeld.de>
 <54D9EDC8.6020508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47697 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751334AbbBXNjN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 08:39:13 -0500
In-Reply-To: <54D9EDC8.6020508@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hello Marek,

sorry for the late response!


On 2015-02-10 12:38, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-02-09 21:28, Tobias Jakobi wrote:
>> Hello!
>> 
>> Marek Szyprowski wrote:
>>> I didn't observe any issues with 'ondemand' governor. I've just 
>>> tested it
>>> on next-20150204 with "[PATCH v2 0/3] Add support for hardware reset 
>>> of
>>> eMMC
>>> card on reboot" patches added
>>> (http://www.spinics.net/lists/linux-mmc/msg30621.html) and reboot 
>>> works
>>> fine.
>> Since I'm not using an eMMC card, I don't think the pwrseq stuff is
>> going to make a difference here.
>> Have you checked this with the PS_HOLD patch applied, or without?
>> Anyway, guess I'm going to recheck this, maybe with some other 
>> governors
>> too.
> 
> PS_HOLD patch is related to shutdown behavior. Reboot doesn't use it. 
> Could you
> point which exactly version did you use and provide the .config which 
> causes
> problems with normal reboot when system runs from SD card? For eMMC you 
> would
> need patches from last linux-next.

I'm currently using this tree:
https://github.com/tobiasjakobi/linux-odroid

In this is the config:
https://raw.githubusercontent.com/tobiasjakobi/odroid-environment/master/sourcecode/system/vanilla-3.19-debug.conf

Upon issuing reboot I get this here on the UART:
chidori ~ # reboot

Broadcast message from root@chidori (ttySAC1) (Mon Feb 23 17:04:44 
2015):

The system is going down for reboot NOW!
INIT: Switching to runlevel: 6
INIT: Sending processes the TERM signal
chidori ~ #  * Stopping local                                            
  [ ok ]
  * Stopping vixie-cron ...                                               
  [ ok ]
  * Saving random seed ...                                                
  [ ok ]
  * Deactivating additional swap space ...                                
  [ ok ]
  * Stopping sshd ...                                                     
  [ ok ]
  * Unmounting network filesystems ...                                    
  [ ok ]
  * Stopping chronyd ...                                                  
  [ ok ]
  * Stopping BlueTooth NAP ...                                            
  [ ok ]
  * Stopping dnsmasq ...                                                  
  [ ok ]
  * Stopping syslog-ng ...                                                
  [ ok ]
  * Shutting down bluetooth ...                                           
  [ ok ]
  * Stopping D-BUS system messagebus ...                                  
  [ ok ]
  * Unmounting loop devices
  * Unmounting filesystems
  *   Unmounting /usr/local/emu ...                                       
  [ ok ]
  *   Unmounting /home ...                                                
  [ ok ]
  *   Unmounting /var ...                                                 
  [ ok ]
  * Deactivating swap devices ...                                         
  [ ok ]
  * Stopping udev ...                                                     
  [ ok ]
  * Saving the shutdown time ...                                          
  [ ok ]
  * Terminating remaining processes ...                                   
  [ ok ]
  * Killing remaining processes ...                                       
  [ ok ]
  * Saving dependency cache ...                                           
  [ ok ]
  * Remounting remaining filesystems read-only ...
  *   Remounting / read only ...
[  113.526626] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)             
  [ ok ]
[  115.609592] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[


Notice the open bracket in the last line. Seems like there is still 
output in the kernel buffer, but the UART is maybe switched off before 
one can see that. At least there is nothing after that, and I have to 
manually restart the board then.

With best wishes,
Tobias
