From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Fri, 27 Jun 2014 10:40:36 +0100
Message-ID: <20140627094036.GD32514@n2100.arm.linux.org.uk>
References: <53A9B99F.4040806@codeaurora.org> <53A9FBB5.60709@codeaurora.org> <53AABCF5.4050403@gmail.com> <53AB45D1.90909@codeaurora.org> <53ABC13C.8030908@gmail.com> <CAGa+x84UTbmFc2Twg9zEcr+ZP2xsq68gFvk=385+_cFM5hvGHg@mail.gmail.com> <20140626151756.GU32514@n2100.arm.linux.org.uk> <53AC77A2.4090207@codeaurora.org> <53ACDFC2.5020206@gmail.com> <53AD34E6.8000302@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:44786 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752736AbaF0Jkp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 05:40:45 -0400
Content-Disposition: inline
In-Reply-To: <53AD34E6.8000302@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Tushar Behera <trblinux@gmail.com>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, kernel-build-reports@lists.linaro.org

On Fri, Jun 27, 2014 at 02:09:58AM -0700, Laura Abbott wrote:
> On 6/26/2014 8:06 PM, Tushar Behera wrote:
>> arm_add_memory is getting called before this is being set, resulting in
>> none of the memory banks getting added[1].
>>
>> setup_machine_fdt -> early_init_dt_scan -> early_init_dt_scan_memory
>>
>> Would it make sense to re-introduce the config option ARM_NR_BANKS and
>> replace max_cnt with NR_BANKS?
>>
>> [1] http://pastebin.com/MawYD7kb
>>
>
> I was hoping to avoid re-introducing the config option but that may be
> the case if we can't make the machine_info work. I'll take a better
> look tomorrow.

The problem with the config option is that it's not single zImage
friendly.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
