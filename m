From: Andrew Eikum <aeikum@codeweavers.com>
Subject: Re: [PATCH] Fix for possible null pointer dereference
 in dma.c
Date: Tue, 20 May 2014 14:29:58 -0500
Message-ID: <20140520192958.GE6639@foghorn.codeweavers.com>
References: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <5379E284.7030700@gmail.com>
 <CAFo99gZ3kVGn04we5OtRtbkceYRs6SiHXRyoX1Gb-SknJH=z=w@mail.gmail.com>
 <537BAA2B.9090906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <537BAA2B.9090906@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 20, 2014 at 09:16:59PM +0200, Tomasz Figa wrote:
> To me having NULL as either data argument of buffer done callback or
> private_data would be a serious driver bug and IMHO it's better to let
> it crash with a NULL pointer dereference to let someone notice than mask
> it by adding a condition.
> 

Please, no.  Regardless of who is at fault, crashes in library code
are insanely frustrating to application developers.  Error codes can
be handled nicely and expressed to the user as an error message.
Crashes are hideous for end users and usually end up being support
nightmares for developers.

Related:
https://git.kernel.org/cgit/linux/kernel/git/kay/libabc.git/tree/README?id=0573b57c7bdb4c82d6acd62f7923a6503f4f679a#n126

Andrew
