From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v6 8/9] mmc: dw_mmc: add support for implementation
 specific callbacks
Date: Tue, 16 Oct 2012 16:25:01 +0530
Message-ID: <CAJuYYwRpHzQGe1e8GcnNoO2L2o4NXGV_LQtVp4BzKkCuobFSBg@mail.gmail.com>
References: <1347905803-22742-1-git-send-email-thomas.abraham@linaro.org>
	<1347905803-22742-9-git-send-email-thomas.abraham@linaro.org>
	<001401cd966c$5fe94590$1fbbd0b0$%jun@samsung.com>
	<CAJuYYwRUhK858ixLfZPz9UVmqJBe0=LdgjhLfazPNHE3zckDjQ@mail.gmail.com>
	<m3haqodsvb.fsf@pullcord.laptop.org>
	<001e01cda22d$86383130$92a89390$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <001e01cda22d$86383130$92a89390$%jun@samsung.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: Chris Ball <cjb@laptop.org>, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, will.newton@imgtec.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 4 October 2012 18:11, Seungwon Jeon <tgih.jun@samsung.com> wrote:
> Monday, September 24, Chris Ball <cjb@laptop.org>
>> Hi,
>>
>> On Thu, Sep 20 2012, Thomas Abraham wrote:
>> >> In non-Exynos platform, host->drv_data has NULL.
>> >
>> > Yes, sorry, I missed that.
>> >
>> > Chris, should I fix this and send the updated patch or shall I send a
>> > separate fix patch.
>>
>> A separate fix patch would be good, please.
>>
>> (I'd normally take an updated patch but Stephen Rothwell's asked for
>> people to hold off rebasing now that -rc7 is out, which is reasonable.)
> Thomas,
>
> Is there any work for fix?
>
> Thanks,
> Seungwon Jeon


Hi Seungwon,

I apologize for not being prompt in fixing this issue reported by you.
James Hogan has now submitted a patch to fix this. ([PATCH] dw_mmc:
fix multiple drv_data NULL dereferences)

Thanks,
Thomas.

>
>>
>> Thanks,
>>
>> - Chris.
>> --
>> Chris Ball   <cjb@laptop.org>   <http://printf.net/>
>> One Laptop Per Child
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
