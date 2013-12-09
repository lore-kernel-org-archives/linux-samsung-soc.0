From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Mon, 9 Dec 2013 23:22:39 +0530
Message-ID: <CAAgF-Bc5wpwsCtvg-i=nwoSgwDb137VkLC78R1tgsf7CqY-KQQ@mail.gmail.com>
References: <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
 <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
 <20131126122031.GA14725@sirena.org.uk>
 <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
 <20131127150534.GW14725@sirena.org.uk>
 <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
 <20131128115351.GC27568@sirena.org.uk>
 <CAAgF-Bc3fOdJ3C-Jrmw-7Vxt_9QSJHEX5kWvCEyu_WBrsMDdEA@mail.gmail.com>
 <20131205114538.GO29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20131205114538.GO29268@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On Thu, Dec 5, 2013 at 5:15 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Dec 05, 2013 at 04:20:03PM +0530, Padma Venkat wrote:
>> On Thu, Nov 28, 2013 at 5:23 PM, Mark Brown <broonie@kernel.org> wrote:
>
>> > OK, so we can probably just reinitialise the dmaengine data after we
>> > reset it?  Like below
>
>> Yes. That works well.
>
> Great.
>
>> As I forgot to add SND_DMAENGINE_PCM_FLAG_NO_RESIDUE flag, I was
>> getting underrun error. After adding this flag audio playback is
>> working fine for smaller files on smdk5420 with pl330 dma driver.
>
> OK, there were some patches on the thread adding residue support to the
> PL330 driver yesterday - hopefully those can get merged at some point
>
>> Except for the crash due to NULL pointer dereference in secondary
>> dai(I posted a patch for the same (ASoC: samsung: Initialize the
>> dma_data for secondary dai)) you can add my
>
>> Tested By: Padmavathi Venna <padma.v@samsung.com>
>
> Excellent, thanks - I'd squashed in your change already.  Like I say I'm
> still concerned that we might need a fix for v3.13 since I can't
> entirely see why the code works as-is.

Here two things
1)crash due to null pointer reference during boot which got fixed by
initializing the secondary dai.
     This crash was not there in mainline because the channel request
happening at runtime and with dmaengine the channel request happening
at boot time. But if some one try to play audio with secondary device
then at run time this crash might happen.
2) overwritting of dma_size during hw_params
    This is not required in mainline because pointer to the whole
s3c_dma_params were being passed as dma_data which has dma_size init.
But with dmaengine we are just passing the pointer to
snd_dmaengine_dai_dma_data which is embedded in s3c_dma_params and
dma_size is outside.


I think this is what you are concern about why it is not working as-is.

Thanks
Padma
