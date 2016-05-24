From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Endless "supply vcc not found, using dummy regulator"
Date: Tue, 24 May 2016 17:53:34 +0200
Message-ID: <574478FE.4070800@samsung.com>
References: <20160521144308.GA13960@sesse.net>
 <20160523134737.GA21683@sesse.net> <20160523144047.GA36908@sesse.net>
 <20160523162455.GW8206@sirena.org.uk> <20160523170617.GA8997@sesse.net>
 <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28711 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751689AbcEXPxo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 11:53:44 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7O00A83UTC4C00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 May 2016 16:53:36 +0100 (BST)
In-reply-to: <20160524152638.GA20341@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: Mark Brown <broonie@debian.org>, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org

On 05/24/2016 05:26 PM, Steinar H. Gunderson wrote:
> On Tue, May 24, 2016 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:
>> I looked quickly through the thread and I am not sure what is exactly
>> your problem.
> 
> My immediate problem is that the repeated (deferred) probing is causing so
> much logging that the system doesn't actually boot. The root causes are a bit
> more complex and muddy (see my previous email for a breakdown).

Ah, I got it.

> 
>> I understood that the Exynos dwc3 driver is leaking the
>> PHY. That is a good catch but your patch is not sufficient. You should
>> clean up starting from devm_clk_get() error. Unless you are fixing
>> this for different kernel version.
> 
> I have zero idea how all of this is supposed to be connected, much less how
> DWC3 works or what the driver is supposed to do. I'm just an end user trying
> to figure out why my system didn't boot. :-)
> 
> Which devm_clk_get() error are you talking about? The one with susp_clk?

Now I saw your original report on Debian bugzilla. Let's stick to v4.5.
The platform_device_alloc() is done in dwc3_exynos_register_phys(). So
on error paths you have clean up starting from next error:

       ret = dwc3_exynos_register_phys(exynos);
        if (ret) {
                dev_err(dev, "couldn't register PHYs\n");
                return ret;
        }

        exynos->dev     = dev;

        exynos->clk = devm_clk_get(dev, "usbdrd30");
        if (IS_ERR(exynos->clk)) {
+		// On each error path since here we need to
+		// revert work done by dwc3_exynos_register_phys()
                dev_err(dev, "couldn't get clock\n");
                return -EINVAL;
        }
        clk_prepare_enable(exynos->clk);


> That's an interesting case because a) nothing actually uses susp_clk
> (it's dead code, presumably waiting for further patches),

It does not look like dead code because it is enabled.

> and b) there was a
> commit not too long ago (42f69a02) upgrading the message from dev_dbg to
> dev_info for reasons I don't understand, making the problem worse.
> (The commit message had an argument that I could accept for changing _to_
> dbg, but not the other way round.

I don't get the rationale behind that change neither...


>> Please send an appropriate separate patch for fixing this. Your email
>> did not reach people, I think.
> 
> I only sent one patch so far, namely the leak fix.

Yeah, but you did not send it to appropriate people. get_maintainer.pl
will point you (Felipe Balbi handles the patches for this driver).

> 
>> What other problems exactly do you have? Late binding of S2MPS11
>> regulator driver? That does not look like a problem. If it is built as
>> a module then it should be loaded, probably from initramfs because
>> these are regulators.
> 
> In this specific case, Debian's initramfs has neglected to include the i2c
> driver in the initramfs, so the regulator doesn't come up until the boot is
> out of the initramfs. That's probably a bug in its own right, and fixing it
> reduces the amount of messages by a _lot_, but even so, it sounds to me like
> the kernel should be able to boot without that fix.

Apparently the s2mps11 regulator driver can be built as module... but is
not a commonly tested configuration. In our testing configs (exynos and
multi_v7) it is built-in. Actually most of PMICs are built in.

Additionally, if you look at the driver, its init was moved earlier from
module_init() to subsys_initcall(). This is kind of manual probe
ordering, used mostly because some depending drivers did not support
probe deferral.

Best regards,
Krzysztof
