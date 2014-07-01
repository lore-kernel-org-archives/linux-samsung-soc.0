From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 4/7] Exynos: add support for 'domain-always-on' property
Date: Tue, 01 Jul 2014 19:54:08 +0200
Message-ID: <53B2F5C0.1000509@gmx.net>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
 <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
 <53B276BE.2090509@gmx.net> <53B27AA3.5030000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53B27AA3.5030000@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


Marek Szyprowski wrote:
> Hello,
> 
> On 2014-07-01 10:52, Tobias Jakobi wrote:
>> Hello Marek,
>>
>> I think you had a similar patch in the tizen tree, but according to
>> Tomasz Figa, it was considered a hack. I don't quite see how this is
>> different.
>>
>> Also, if I have been following the discussion correctly, then the
>> powerdomain issue essentially is about the question which SoC block
>> needs the LCD0 domain and how the proper power on/off sequences should
>> look like.
>>
>> At least the mixer power issue, which I pointed out some time ago, seems
>> to be deal with now:
>> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=381be025ac1a6dc8efebdf146ced0d4a6007f77b
>>
> 
> Well, that patch solves power on/off sequence issue with mixer and hdmi,
> but it didn't solve the issue with additional managing of power domain
> on/off. You can check that if you remove always on property, system will
> freeze when hdmi cable is connected for the second time. I've investigated
> it for some time, but right now I didn't find any 100% reliable solution
> other than keeping the power domain enabled all the time. At least for
> now, this patch lets you use HDMI without any stability issues.
Hmm, I have also applied a similar hack to force TV and LCD0 pd on on my
system, but I didn't experience this behaviour (cable reconnecting).
Guess I have to recheck with some more recent tree to make sure.


> I've only found that there are still at least 2 issues with power domains.
> One is Mixer/Video Processor dependency on LCD0 domain, second is the
> proper
> power on/off sequence of HDMI/Mixer and TV domain. Forcing both domains to
> 'always on' workarounds both issues for now. Right now I have no better
> idea.
I had the impression that the patch from above, plus this one
https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=245f98f269714c08dc6d66d021d166cf36059bc4
were supposed to fix these issues. I haven't tested them yet, because of
lack of time, but Rahul's patch appears to fix mixer poweroff, and
Inki's patch the sequencing (VP, Mixer and last but not least, the HDMI).


> Later, once the proper sequence is found we can remove those properties
> from Odroid DTS.
I dunno, because you would have to support the property to the end of
time then, even though it's not used anymore. Isn't that the kind of
thing that shouldn't end up in DT bindings specs?



> 
> Best regards


With best wishes,
Tobias
