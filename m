From: Dron Gus <dron0gus@gmail.com>
Subject: S3C2416 clock tree
Date: Tue, 9 Nov 2010 18:52:20 +0300
Message-ID: <AANLkTinOCFtYW1BNydU7CMw-jL+Pwbazeq9KgW8PPibT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60927 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815Ab0KIPwV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Nov 2010 10:52:21 -0500
Received: by pzk28 with SMTP id 28so1313341pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Nov 2010 07:52:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi!

I work with custom board based on s3c2416 SoC. I'm trying to make
cpufreq work. I wrote the driver based on cpu-freq.c from
mach-s3c2410.
On kernel start i get error message:
cpufreq: failed to get clock 'armclk'
s3c2416_cpufreq_add: failed to get clocks
So i have to add dummy 'armclk' and some dummy clk_ops functions.
Now cpufreq starts, and tries to change freqs, calling to my
s3c2416_cpufreq_calcdivs. But the problem is that it passes wrong fclk
value. Pll rums on 800 MHz, armclk = 400 MHz, hclk = 133, pclk = 66. I
get fclk = 400 MHz. It is two time smaller than mpll.
I can not understood is value of fclk the same as armclk or as mpll?
To count correct armclk divider i must know mpll freq. But as i see in
s3c2443_common_setup_clocks and in s3c24xx_setup_clocks, mpll rate is
set the same as fclk, but fclk = pll / get_fdiv(clkdiv0);
So there is three ways to solve this problem, as i see:
1) pass one more argument to s3c24xx_setup_clocks with value of mpll.
This will break to many mach-s3c****
2) write get_rate for mpll clock and set mpll as a parent for fclk.
Problem is that PLLs are diferent on diferent s3c SoCs.
3) the same as 2, but use function get_mpll, wich is passed to
s3c2443_common_setup_clocks.

Witch way is preferred?

Thanks.

Andrey.
